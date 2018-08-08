package com.dice.reinforce;

import android.app.Application;
import android.widget.Toast;

import com.dice.channellibrary.DiceChannelHelper;

/**
 * 创建时间： 2018/8/8:14:32
 * 创建人：renqi
 */
public class App extends Application {

    @Override
    public void onCreate() {
        super.onCreate();
        try {
            String  channelName = DiceChannelHelper.getChannel(this.getApplicationContext());
            Toast.makeText(this.getApplicationContext(),channelName,Toast.LENGTH_SHORT).show();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
