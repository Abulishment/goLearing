package models

import "gin-ranking/dao"

type Player struct {
	Id          int    `json:"id"`
	Aid         int    `json:"aid"`
	Ref         string `json:"ref"`
	NickName    string `json:"nickname"`
	Declaration string `json:"declaration"`
	Avatar      string `json:"avatar"`
	Score       int    `json:"score"`
}

func (Player) TableName() string {
	return "player"
}

func GetPlayers(aid int) ([]Player, error) {
	var players []Player
	err := dao.Db.Where("aid = ?", aid).Find(&players).Error
	return players, err
}
