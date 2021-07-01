import React from 'react';
import styled from 'styled-components';
import { useState, useEffect } from 'react';
import { AttackButtonBase } from "./AttackButtonBase";
import { Form } from './Form';

const ImageContainer = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
`

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

export const SecondImage = (props) => {
  const word = props.word;
  const setWord = props.setWord;
  const ACTIONS = [
    {action: 'キック', reaction: 'いてぇ'},
    {action: 'パンチ', reaction: 'やったな！'},
    {action: 'ビンタ', reaction: 'いやん'},
  ];

  const [attack, setAttack] = useState(ACTIONS);

  useEffect(() => {
    setWord('かかってこいや')
  },[])

  return (
    <ImageContainer>
      <Title>ニキビ大魔神お仕置きコーナー</Title> 
      <MainImage src={"/images/ニキビ大魔神.jpg"} alt='image'/>
      <Word>{word}</Word>
      <AttackButtonBase setWord={setWord} ACTIONS={attack}/>
      <Form setAttack={setAttack} ACTIONS={ACTIONS}/>
    </ImageContainer>
  )
}