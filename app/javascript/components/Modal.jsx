import React from 'react';
import styled from 'styled-components';

const Container = styled.div`
  height: 100vh;
  width: 100vw;
  background: rgba(0,0,0,0.5);
  position: fixed;
  top: 0;
  left: 0;
  z-index: 30;
`

const Wrapper = styled.div`
  height: 200px;
  width: 300px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  background-color: #2a2a2a;
  color: white;
  position: relative;
  top: calc(50vh - 100px);
  left: calc(50vw - 150px);
`

const ButtonContainer = styled.div`
  width: 40%;
  margin-top: 20px;
  display: flex;
  justify-content: space-around;
`

export const Modal = (props) => {

  const submitForm = () => {
    props.setAttack([...props.ACTIONS, {action: action, reaction: reaction}]);
  }

  return (
    <Container>
      <Wrapper>
        <h3>攻撃を追加しますか？</h3>
        <ButtonContainer>
          <button onClick={submitForm}>はい</button>
          <button onClick={props.setModal(false)}>いいえ</button>
        </ButtonContainer>
      </Wrapper>
    </Container>
  )
}