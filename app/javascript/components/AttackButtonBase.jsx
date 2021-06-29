import React from 'react';
import styled from 'styled-components';

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

export const AttackButtonBase = (props) => {
  const setWord = props.setWord;
  const reaction = props.reaction;
  return (
    <AButton onClick={() => setWord(reaction)}>
      { props.children }
    </AButton>
  )
}