import React from 'react';
import styled from 'styled-components';

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

export const Image = (props) => {
  const word = props.word;
  return (
    <div>
      <Title>ニキビちゃんへのいたずらコーナー</Title> 
      <MainImage src={"/images/吹き出し.jpg"} alt='image'/>
      <Word>{word}</Word>
    </div>
  )
}