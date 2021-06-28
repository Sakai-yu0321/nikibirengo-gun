import React from 'react';
import styled from 'styled-components';

const Buttons = styled.div`
  width: 400px;
  display: flex;
  justify-content: space-around;
`
const AButton = styled.button`
  border: none;
  background-color: #2a2a2a;
  padding: 20px;
  border-radius: 50px;
  color: white;
  :active {
    position: relative;
    bottom: -3px;
  }
`

export const Button = (props) => {
  const setWord = props.setWord;
  return (
    <Buttons>
      <AButton onClick={() => setWord('痛え！')}>
        <i class="fa fa-hand-grab-o"></i>パンチ
      </AButton>
      <AButton onClick={() => setWord('いやん！')}>
        <i class="fa fa-paw"></i>キック
      </AButton>
      <AButton onClick={() => setWord('ぶへぇ！')}>
        <i class="fa fa-hand-paper-o"></i>ビンタ
      </AButton>
    </Buttons>
  )
}