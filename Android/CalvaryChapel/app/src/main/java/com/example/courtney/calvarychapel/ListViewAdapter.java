package com.example.courtney.calvarychapel;

import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by Courtney on 4/13/17.
 */

public class ListViewAdapter extends BaseAdapter {

    Context context;
    LayoutInflater inflater;
    ArrayList<HashMap<String, String>> data;
    HashMap<String, String> resultp = new HashMap<String, String>();

    public ListViewAdapter(Context context, ArrayList<HashMap<String, String>> arraylist) {
        this.context = context;
        data = arraylist;
    }

    @Override
    public int getCount() {
        return data.size();
    }

    @Override
    public Object getItem(int position) {
        return null;
    }

    @Override
    public long getItemId(int position) {
        return 0;
    }

    public View getView(final int position, View convertView, ViewGroup parent) {
        TextView eventName;
        TextView eventDate;
        TextView month;
        TextView day;

        inflater = (LayoutInflater) context
                .getSystemService(Context.LAYOUT_INFLATER_SERVICE);

        View itemView = inflater.inflate(R.layout.listview_item, parent, false);

        resultp = data.get(position);

        eventName = (TextView) itemView.findViewById(R.id.eventname);
        month = (TextView) itemView.findViewById(R.id.month);
        day = (TextView) itemView.findViewById(R.id.day);

        eventName.setText(resultp.get(SecondFragment.NAME));
        month.setText(resultp.get(SecondFragment.MONTH));
        day.setText(resultp.get(SecondFragment.DAY));

        itemView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                resultp = data.get(position);
                Bundle bundle = new Bundle();
                bundle.putString("eventname", resultp.get(SecondFragment.NAME));
                bundle.putString("month", resultp.get(SecondFragment.MONTH));
                bundle.putString("day", resultp.get(SecondFragment.DAY));
                bundle.putString("starttime", resultp.get(SecondFragment.START_TIME));
                bundle.putString("endtime", resultp.get(SecondFragment.END_TIME));
                bundle.putString("location", resultp.get(SecondFragment.LOCATION));
                bundle.putString("groupname", resultp.get(SecondFragment.GROUP_NAME));
                bundle.putString("leadername", resultp.get(SecondFragment.LEADER_NAME));
                bundle.putString("leaderphone", resultp.get(SecondFragment.LEADER_PHONE));
                bundle.putString("leaderemail", resultp.get(SecondFragment.LEADER_EMAIL));

                Fragment fragment = new SingleItemFragment();
                fragment.setArguments(bundle);
                FragmentManager fragmentManager = ((Activity) context).getFragmentManager();
                fragmentManager.beginTransaction()
                        .replace(R.id.content_frame, fragment)
                        .addToBackStack("single_item_fragment")
                        .commit();
            }
        });

        return itemView;
    }

}
