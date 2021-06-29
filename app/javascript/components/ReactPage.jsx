import React from "react"
import { useState } from "react"; 
import styled from "styled-components";
import { Image } from "./Image";
import { SecondImage } from "./SecondImage";
import { Form } from "./Form";

const Container = styled.div`
  margin-top: 150px;
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-bottom: 100px;
`

const CatchCopy = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  height: 700px;
  margin-bottom: -700px;
  z-index: -1;
`

const UnbeatableBattle = styled.img`
  width: 80px;
  margin-right: 150px;
`

const ItIsHere = styled.img`
  width: 80px;
  margin-left: 150px;
`

const TabButton = styled.div`
  height: 50px;
  width: 220px;
  display: flex;
  justify-content: space-around;
  align-items: flex-start;
`
const Button = styled.button`
  height: 23px;
`

function ReactPage() {
  const [word, setWord] = useState('なんだよやんのか');
  const [tab, setTab] = useState('ニキビちゃん');

  return (
    <Container>
      <CatchCopy>
        <ItIsHere
        src={"/images/ここにある.jpg"} alt='image'/>
        <UnbeatableBattle
        src={"/images/負けられない戦いが.jpg"} alt='image'/>
        </CatchCopy>
      <TabButton>
        <Button onClick={() => setTab('ニキビちゃん')}>
          ニキビちゃん
        </Button>
        <Button onClick={() => setTab('ニキビ大魔神')}>
          ニキビ大魔神
        </Button>
      </TabButton>
      {
        tab === 'ニキビちゃん' ?
        <Image word={word} setWord={setWord} /> :
        <SecondImage word={word} setWord={setWord}/>
      }
      <Form />
    </Container>
  )
}

export default ReactPage;