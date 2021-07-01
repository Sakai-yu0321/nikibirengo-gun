import React from 'react';
import styled from 'styled-components';

const Buttons = styled.div`
  width: 400px;
  display: flex;
  justify-content: space-around;
`

const Button = styled.button`
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

export const AttackButtonBase = (props) => {
  const setWord = props.setWord;
  const ACTIONS = props.ACTIONS;
  return (
    <Buttons>
      {
        ACTIONS.map((word, i) => {
          return <Button onClick={() => setWord(word.reaction)}
          key={i}>{word.action}</Button>
        })
      }
    </Buttons>
  )
}

