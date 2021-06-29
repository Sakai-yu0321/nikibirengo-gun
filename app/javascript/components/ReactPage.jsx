import React from "react"
import { useState } from "react"; 
import styled from "styled-components";
import { Image } from "./Image";
import { SecondImage } from "./SecondImage";

const Container = styled.div`
  margin-top: 150px;
  display: flex;
  flex-direction: column;
  align-items: center;
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
    </Container>
  )
}

export default ReactPage;