package controllers

import (
	"gin-ranking/cache"
	"gin-ranking/models"
	"strconv"
	"time"

	"github.com/gin-gonic/gin"
)

type PlayerController struct {
}

func (p PlayerController) GetPlayers(c *gin.Context) {
	aidStr := c.DefaultPostForm("aid", "0")
	aid, _ := strconv.Atoi(aidStr)

	rs, err := models.GetPlayers(aid, "id asc")
	if err != nil {
		ReturnError(c, 4004, "无相关信息")
		return
	}
	ReturnSuccess(c, 0, "success", rs, 1)
}

func (p PlayerController) GetRanking(c *gin.Context) {
	aidStr := c.DefaultPostForm("aid", "0")
	aid, _ := strconv.Atoi(aidStr)

	//先取redis的，redis没有再从mysql取，并且在redis中保存（注意：redis数据需要设置过期时间，避免占用过多）
	var redisKey string = "ranking:" + aidStr
	rs, err := cache.Rdb.ZRevRange(cache.Rctx, redisKey, 0, -1).Result()
	if err == nil && len(rs) > 0 {
		//由于redis中仅保存id，需通过id取出相应的player信息
		var players []models.Player
		for _, value := range rs {
			id, _ := strconv.Atoi(value)
			rsInfo, _ := models.GetPlayerInfo(id)
			if rsInfo.Id != 0 {
				players = append(players, rsInfo)
			}
		}
		ReturnSuccess(c, 0, "success-redis", players, 1)
		return
	}

	//从mysql中取，并将id，score保存至redis中的一个zset中
	rsDb, errDb := models.GetPlayers(aid, "score desc")
	if errDb == nil {
		for _, value := range rsDb {
			cache.Rdb.ZAdd(cache.Rctx, redisKey, cache.ZScore(value.Id, value.Score)).Err()
		}
		cache.Rdb.Expire(cache.Rctx, redisKey, 24*time.Hour)

		ReturnSuccess(c, 0, "success", rsDb, 1)
		return
	}
	ReturnError(c, 4004, "无相关信息")
}
