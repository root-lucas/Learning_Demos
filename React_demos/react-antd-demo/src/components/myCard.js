import React from 'react'
import { Card } from 'antd';

// 引入标准Fetch及IE兼容依赖
import axios from 'axios'

export default class myCard extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            lists: []
        }
    }
    // 获取数据
    fetchFn = () => {
        const _this=this;
        axios.get('./data.json')
            .then((res) => { console.log('res = ', res.data); _this.setState({ lists: res.data.listData }) })
            .catch((e) => { console.log('error = ',e.message) })
    }

    componentDidMount() {
        this.fetchFn()
    }

    render() {
        return (
            <Card title="资源导航" style={{ width: "800px", margin: "0 auto" }} className="animate__animated animate__zoomIn">
                {
                    this.state.lists.map((e) => {
                        return (
                            <p className="doclist"><a href={e.url} target="_blank">{e.title}</a></p>
                        )
                    })
                }
            </Card>
        )
    }
}

