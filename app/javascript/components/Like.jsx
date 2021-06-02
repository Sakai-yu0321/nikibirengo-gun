import React from "react"
import PropTypes from "prop-types"

class Like extends React.Component {
  constructor(props) {
    super(props);
    // stateを定義してください
    this.state = {counts:0}; 
    this.state = {is_liked: false}
  }

  ajaxMain(){
    console.log('Hello World')
    // $.ajax({
    //   url: this.props.url,                               //このURLは次でセットします
    //   type:method,                                       //今回はPOSTで送ります
    //   dataType: 'json',
    //   cache: false,
    //   data: {post_id: this.props.post},                  //このpostも次でセットします
    //   success: function(data) {
    //       if(data.like){                                 //ここはあとで活きてきます笑
    //           this.setState({is_liked: data.liked});     //responseのlikedをstateのis_likedに反映させます
    //       };
    //       this.setState({counts: data.counts});          //responseのcountsをstateのcountsにに反映させます
    //   }.bind(this),                                      //bindしないとthisが使えなくてエラりますw
    //   error: function(xhr, status, err) {
    //       console.error(this.props.url, status, err.toString());
    //   }.bind(this)
    // });
  }

  render () {
    return (
      // ↓<React.Fragment>の省略形。
      // <>
      // 要素が並列になっていない場合、<></>で囲む必要はない。
        <button onClick={this.ajaxMain}>いいね！</button>
      // </>
      // ↑</React.Fragment>の省略形
    )
  }
}

export default Like
