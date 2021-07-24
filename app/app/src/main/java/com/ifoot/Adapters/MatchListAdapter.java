package com.ifoot.Adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.ifoot.Models.Match;
import com.ifoot.R;

import java.util.ArrayList;

public class MatchListAdapter extends BaseAdapter {
    Context context;
    ArrayList<Integer> matches = new ArrayList<Integer>();

    public MatchListAdapter(Context context, ArrayList<Integer> matches) {
        this.context = context;
        this.matches = matches;
    }

    @Override
    public int getCount() {
        return 0;
    }

    @Override
    public Object getItem(int i) {
        return matches.get(i);
    }

    @Override
    public long getItemId(int i) {
        return 0;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup container) {
        if (convertView == null) {
            convertView = LayoutInflater.from(this.context).inflate(R.layout.activity_match_list, container, false);
        }

        ((TextView) convertView.findViewById(android.R.id.text1))
                .setText(getItem(position).toString());
        return convertView;
    }
}
