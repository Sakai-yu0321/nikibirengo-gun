import React from 'react';
import styled from 'styled-components';
import { useEffect } from 'react';
import { AttackButtonBase } from "./AttackButtonBase";

const Title = styled.div`
  background-color: #2a2a2a;
  color: white;
  padding: 20px;
  border-radius: 10px;
  margin: 0 auto;
  margin-bottom: 20px;
  width: 300px;
  text-align: center;
`

const MainImage = styled.img`
  width: 400px;
`

const Word = styled.div`
  display: flex;
  justify-content: center;
  position: relative;
  top: -240px;
  height: 16px;
  margin-bottom; -16px;
  z-index: 20;
`

const Buttons = styled.div`
  width: 400px;
  display: flex;
  justify-content: space-around;
`

export const SecondImage = (props) => {
  const word = props.word;
  const setWord = props.setWord;
  useEffect(() => {
    setWord('かかってこいや')
  },[])
  return (
    <div>
      <Title>ニキビ大魔神へのいたずらコーナー</Title> 
      <MainImage src={"/images/ニキビ大魔神.jpg"} alt='image'/>
      <Word>{word}</Word>
      <Buttons>
        <AttackButtonBase setWord={setWord} reaction={'ニキビ痕になってやる！'}>
          つぶす
        </AttackButtonBase>
        <AttackButtonBase setWord={setWord} reaction={'グアぁ！'}>
          ニキビパッチを被せる
        </AttackButtonBase>
        <AttackButtonBase setWord={setWord} reaction={'まいりました！'}>
          皮膚科に行く
        </AttackButtonBase>
      </Buttons>
    </div>
  )
}