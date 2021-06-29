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

export const Image = (props) => {
  const word = props.word;
  const setWord = props.setWord;
  useEffect(() => {
    setWord('なんだよやんのか')
  },[])
  return (
    <div>
      <Title>ニキビちゃんへのいたずらコーナー</Title> 
      <MainImage src={"/images/吹き出し.jpg"} alt='image'/>
      <Word>{word}</Word>
      <Buttons>
        <AttackButtonBase setWord={setWord} reaction={'痛え'}>
          キック
        </AttackButtonBase>
        <AttackButtonBase setWord={setWord} reaction={'ふげぇ！'}>
          パンチ
        </AttackButtonBase>
        <AttackButtonBase setWord={setWord} reaction={'いやん！'}>
          ビンタ
        </AttackButtonBase>
      </Buttons>
    </div>
  )
}