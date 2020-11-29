import React, { Component } from 'react'
import { Form, Input, DatePicker, TimePicker, Select, Checkbox, Radio, Button, message } from 'antd'
import { FormInstance } from 'antd/lib/form';
const { TextArea } = Input;
const { Option } = Select;

class MyForm extends Component {
    constructor(props) {
        super(props)
        this.state = {}
        // this.formRef = React.createRef<FormInstance>();

    }

    success = () => {
        // this.formRef.current.resetFields(null);
        message.success('操作成功!');
    }

    render() {
        return (
            <Form style={{ width: '400px' }}>
                <Form.Item name="note" label="输入框" rules={[{ required: true }]} >
                    <Input placeholder='请输入....' style={{ borderRadius: '10px' }} />
                </Form.Item>
                <Form.Item name="date-picker" label="DatePicker" rules={[{ required: true }]}>
                    <DatePicker style={{ borderRadius: '10px' }} />
                    <TimePicker style={{ borderRadius: '10px' }} />
                </Form.Item>
                <Form.Item
                    id="control-textarea"
                    label="文本域"
                >
                    <TextArea type="textarea" id="control-textarea" rows={5} style={{ borderRadius: '10px' }} />
                </Form.Item>
                <Form.Item>
                    Select 选择器：
                    <Select defaultValue="lucy" style={{ width: 180 }}>
                        <Option value="jack">Jack</Option>
                        <Option value="lucy">Lucy</Option>
                        <Option value="disabled" disabled>
                            Disabled
                        </Option>
                        <Option value="lucas">lucas</Option>
                    </Select>
                </Form.Item>
                <Form.Item>
                    多选框：
                    <Checkbox>Checkbox1</Checkbox>
                    <Checkbox>Checkbox2</Checkbox>
                    <Checkbox>Checkbox3</Checkbox>
                </Form.Item>
                <Form.Item>
                    <Radio.Group>
                        单选框：
                        <Radio value={1}>A</Radio>
                        <Radio value={2}>B</Radio>
                        <Radio value={3}>C</Radio>
                        <Radio value={4}>D</Radio>
                    </Radio.Group>
                </Form.Item>
                <Form.Item wrapperCol={{ span: 6, offset: 3 }} style={{ marginTop: 24 }}>
                    <Button type="primary" htmlType="button" onClick={this.success}>
                        确定
                    </Button>
                </Form.Item>
            </Form>
        )
    }
}

export default MyForm