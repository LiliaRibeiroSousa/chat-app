/* eslint-disable react/prop-types */

import { MultiChatSocket, MultiChatWindow, useMultiChatLogic} from 'react-chat-engine-advanced'

const ChatsPage = (props) => {
  
    const chatProps = useMultiChatLogic(
      '3f9c0871-7c0d-4633-8002-7da9915fe325',
      props.user.username,
       props.user.secret)

    return (
    <div style={{height: '100vh'}}>
        <MultiChatWindow {...chatProps} />
        <MultiChatSocket {...chatProps} style={{ height: '100vh'}} />

    </div>)
}

export default ChatsPage