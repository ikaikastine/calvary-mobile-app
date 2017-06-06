package com.example.courtney.calvarychapel;

import android.app.Fragment;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

/**
 * Created by Courtney on 4/13/17.
 */

public class SingleItemFragment extends Fragment {
    String eventname;
    String month;
    String day;
    String starttime;
    String endtime;
    String location;
    String groupname;
    String leadername;
    String leaderemail;
    String leaderphone;
    View myView;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        myView = inflater.inflate(R.layout.singleitemview, container, false);

        eventname = getArguments().getString("eventname");
        month = getArguments().getString("month");
        day = getArguments().getString("day");
        starttime = getArguments().getString("starttime");
        endtime = getArguments().getString("endtime");
        location = getArguments().getString("location");
        groupname = getArguments().getString("groupname");
        leadername = getArguments().getString("leadername");
        leaderemail = getArguments().getString("leaderemail");
        leaderphone = getArguments().getString("leaderphone");

        TextView txtName = (TextView) myView.findViewById(R.id.eventname);
        TextView txtMonth = (TextView) myView.findViewById(R.id.month);
        TextView txtDay = (TextView) myView.findViewById(R.id.day);
        TextView txtStart = (TextView) myView.findViewById(R.id.starttime);
        TextView txtEnd = (TextView) myView.findViewById(R.id.endtime);
        TextView txtLocation = (TextView) myView.findViewById(R.id.location);
        TextView txtGroup = (TextView) myView.findViewById(R.id.groupname);
        TextView txtLeaderName = (TextView) myView.findViewById(R.id.leadername);
        TextView txtLeaderPhone = (TextView) myView.findViewById(R.id.leaderphone);
        TextView txtLeaderEmail = (TextView) myView.findViewById(R.id.leaderemail);


        txtName.setText(eventname);
        txtMonth.setText(month);
        txtDay.setText(day);
        txtStart.setText(starttime);
        txtEnd.setText(endtime);
        txtLocation.setText(location);
        txtGroup.setText(groupname);
        txtLeaderName.setText(leadername);
        txtLeaderPhone.setText(leaderphone);
        txtLeaderEmail.setText(leaderemail);

        return myView;
    }
}
