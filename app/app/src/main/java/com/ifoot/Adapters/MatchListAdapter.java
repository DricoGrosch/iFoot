package Adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.ArrayList;

import Models.Match;
import com.ifoot.R;

public class MatchListAdapter extends BaseAdapter {
    Context context;
    ArrayList<Match> matches = new ArrayList<Match>();

    public MatchListAdapter(Context context, ArrayList<Match> matches) {
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
