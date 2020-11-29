import { Input, Button, List } from 'antd';
import 'antd/dist/antd.css'
import React from 'react'

// 子向父组件通信
export default function TodoListUI(props) {
    return (
        <div>
            <h1>todoList</h1>
            <Input onChange={props.changeVal} value={props.value} style={{ width: '300px' }} placeholder="todoList" />
            <Button onClick={props.add} type="primary">添加</Button>
            <List
                style={{ width: '300px' }}
                // header={<div>Header</div>}
                // footer={<div>Footer</div>}	
                // dataSource={data}
                bordered
                dataSource={props.dataSource}
                renderItem={(item, index) => (
                    <List.Item>
                        {item}
                        <Button type='danger' onClick={() => props.remove(index)}>删除</Button>
                    </List.Item>
                )}
            />
        </div>
    )
}