package controllers

import (
	"gin-ranking/cache"
	"gin-ranking/models"
	"strconv"

	"github.com/gin-gonic/gin"
)

type VoteController struct {
}

func (v VoteController) AddVote(c *gin.Context) {
	userIdStr := c.DefaultPostForm("userId", "0")
	playerIdStr := c.DefaultPostForm("playerId", "0")
	userId, _ := strconv.Atoi(userIdStr)
	playerId, _ := strconv.Atoi(playerIdStr)

	//判断参数合法性
	if userId == 0 || playerId == 0 {
		ReturnError(c, 4001, "请输入正确的信息")
		return
	}

	//check existence of user and player
	user, _ := models.GetUserInfo(userId)
	if user.Id == 0 {
		ReturnError(c, 4001, "投票用户不存在")
		return
	}

	player, _ := models.GetPlayerInfo(playerId)
	if player.Id == 0 {
		ReturnError(c, 4001, "参赛选手不存在")
		return
	}

	//check whether or not this user hao voted this player.make sure one user can just vote one player one time.
	vote, _ := models.GetVoteInfo(userId, playerId)
	if vote.Id != 0 {
		ReturnError(c, 4001, "已投票")
		return
	}

	//afte check all invalid situation.add vote.
	rs, err := models.AddVote(userId, playerId)
	if err == nil {
		//更新参赛选手score字段，加一
		if updateErr := models.UpdatePlayerScore(playerId); updateErr != nil {
			ReturnError(c, 4001, updateErr)
		} else {
			ReturnSuccess(c, 0, "投票成功", rs, 1)
			//由于票数改变了，需要同时更新redis中相应score
			var redisKey string = "ranking:" + strconv.Itoa(player.Aid)
			cache.Rdb.ZIncrBy(cache.Rctx, redisKey, 1, strconv.Itoa(playerId))
		}
		return
	}
	ReturnError(c, 4004, "投票失败，请联系管理员")
}
