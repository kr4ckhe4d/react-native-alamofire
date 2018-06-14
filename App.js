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
  TouchableOpacity
} from 'react-native';

type Props = {};
export default class App extends Component<Props> {
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
