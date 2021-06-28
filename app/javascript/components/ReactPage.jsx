import React from "react"
import { useState } from "react"; 
import styled from "styled-components";
import { Button } from "./Button";
import { Image } from "./Image";
import { SecondImage } from "./SecondImage";

const Container = styled.div`
  margin-top: 150px;
  display: flex;
  flex-direction: column;
  align-items: center;
`

function ReactPage() {
  const [word, setWord] = useState('なんだよやんのか');
  const [tab, setTab] = useState('ニキビちゃん');
  return (
    <Container>
      <div>
        <button onClick={() => setTab('ニキビ大魔神')}>
          ニキビ大魔神
        </button>
        <button onClick={() => setTab('ニキビちゃん')}>
          ニキビちゃん
        </button>
      </div>
      {
        tab === 'ニキビちゃん' ?
        <Image word={word}/> :
        <SecondImage word={word}/>
      }
      <Button setWord={setWord}/>
    </Container>
  )
}

export default ReactPage;