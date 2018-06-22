package org.thealpha.model;

import java.io.Serializable;
import java.util.List;

/**
 * Created by kangwenjie on 17-12-15.
 */
public class Cooperater_teastu implements Serializable{
    private String name;

    private int count;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
