package com.qf.courier.util;

import java.util.ArrayList;
import java.util.List;

//返回结果类
public class ResultMap<T> {
    private boolean status;//标志：true（成功），false（失败）
    private boolean op;//管理员权限
    private String message;//失败原因
    private List<T> list = new ArrayList<>();//查询数据

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public boolean isOp() {
        return op;
    }

    public void setOp(boolean op) {
        this.op = op;
    }
}
