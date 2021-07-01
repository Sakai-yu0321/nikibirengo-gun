import React from 'react';
import { useState } from 'react';
import styled from 'styled-components';

const FormContainer = styled.form`
  display: flex;
  flex-direction: column;
  align-items: center;
  background-color: white;
  border: 1px solid black;
  border-radius: 10px;
  padding: 20px;
  width: 250px; 
  margin-top: 40px;
`

const Input = styled.input`
  margin-top: 5px;
`

export const Form = (props) => {
  const [action, setAction] = useState('');
  const [reaction, setReaction] = useState('');

  const submitForm = (e) => {
    e.preventDefault();
    props.setAttack([...props.ACTIONS, {action: action, reaction: reaction}]);
  }

  return (
    <FormContainer onSubmit={submitForm}>
      <h3>新しい攻撃を追加</h3>
      <Input type='text' value={action} placeholder='攻撃'
             onChange={(e) => setAction(e.target.value)}></Input>
      <Input type='text' value={reaction} placeholder='リアクション'
             onChange={(e) => setReaction(e.target.value)}></Input>
      <Input type='submit'></Input>
    </FormContainer>
  )
}