package dao

import (
	"gin-ranking/config"
	"gin-ranking/pkg/logger"
	"time"

	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

var (
	Db  *gorm.DB
	err error
)

// mysql在使用Open连接mysql时，若连接失败，后续不会像redis时一样重试，而是返回error，所以需要一直尝试连接直到成功。
func init() {
	Db, err = gorm.Open("mysql", config.Mysqldb)
	for err != nil {
		logger.Error(map[string]interface{}{
			"mysql connect error": err.Error(),
		})
		time.Sleep(5 * time.Second)
		Db, err = gorm.Open("mysql", config.Mysqldb)
	}

	if Db.Error != nil {
		logger.Error(map[string]interface{}{
			"database error": Db.Error,
		})
	}

	Db.DB().SetMaxIdleConns(10)
	Db.DB().SetMaxOpenConns(100)
	Db.DB().SetConnMaxLifetime(time.Hour)
}
