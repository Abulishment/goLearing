package cache

import (
	"context"
	"gin-ranking/config"

	"github.com/redis/go-redis/v9"
)

var (
	Rdb  *redis.Client
	Rctx context.Context
)

// redis初始化时如果指定的redis服务器未启动也没关系，因为会在之后使用时重新连接.
func init() {
	Rdb = redis.NewClient(&redis.Options{
		Addr:     config.RedisAddress,
		Password: config.RedisPassword,
		DB:       config.RedisDb,
	})
	Rctx = context.Background()
}

func ZScore(id int, score int) redis.Z {
	return redis.Z{Score: float64(score), Member: id}
}
