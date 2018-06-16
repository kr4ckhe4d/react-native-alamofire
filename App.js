/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  TouchableOpacity,
  NativeModules,
  NativeEventEmitter
} from 'react-native';

type Props = {};

const { AlamofireManagerObjC, AlamofireManagerSwift } = NativeModules;


export default class App extends Component<Props> {

  constructor(props) {
    super(props);
    this.subscription = null;
}

componentDidMount() {
  const EVENT_NAME = new NativeEventEmitter(AlamofireManagerSwift);
  this.subscription = EVENT_NAME.addListener(
                           'MyEvent',
                           (message) => {
                            console.log("Progress: ", message,"%");
                            if (message == 100){
                              this.subscription.remove();
                              console.log("Subscription Removed");
                            }
                           });
}

  render() {
    return (
      <View style={styles.container}>
        <TouchableOpacity
          style={styles.button}
          onPress={this.btnClicked}
          activeOpacity={1}>
          <Text style={styles.text}>Click Here</Text>
        </TouchableOpacity>
      </View>
    );
  }

  btnClicked = () =>{
    // AlamofireManagerObjC.addEvent('Birthday Party', '4 Privet Drive, Surrey',(result) => {
    //   console.log("Result: ",result);
    // });

    // AlamofireManagerSwift.addEvent('One', 'Two', 3, (result) => {
    //   console.log("Result Swift: ",result);
    // });

    AlamofireManagerSwift.alamofireRequest('https://jsonplaceholder.typicode.com/posts',(result) => {
      console.log("Result Alamofire Swift: ",result);
    });

    console.log("Button Tapped.");
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
    flexDirection: 'row'
  },
  button: {
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: '#ffc400',
    height: 50,
    margin:20,
    borderRadius: 3,
    zIndex: 100,
    flex:1
  },

  text: {
    color: 'black',
    backgroundColor: 'transparent'
  }
});
