package tw.edu.vnu.guessnumber;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class MainActivity extends AppCompatActivity {

    private final static int NUMBER_LENGTH = 3;

    private EditText inputText;
    private TextView respond;

    private List<String> numList;
    private String result;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        inputText = (EditText) findViewById(R.id.input_number);
        respond = (TextView) findViewById(R.id.respond);

        getRandomNumber();
    }

    private void getRandomNumber() {
        List<String> list = new ArrayList<>();

        for (int i = 0; i < 10; i++) {
            list.add(String.valueOf(i));
        }

        numList = new ArrayList<>();

        while (numList.size() < NUMBER_LENGTH) {
            int index = (int) (Math.random() * 10);

            if (index - 1 > list.size()) {
                continue;
            }
            numList.add(list.get(index));
            result += list.get(index);
            list.remove(index);
        }

    }

    private void showMsg(String msg, boolean isClear) {
        respond.setText(msg);

        if (isClear) {
            inputText.setText("");
        }
    }

    public void guess_Click(View view) {
        String inputNumber = inputText.getText().toString().trim();

        if (inputNumber.length() == 0) {
            showMsg(getString(R.string.error), true);
            return;
        }

        List<String> guessNumerList = new ArrayList<>();
        Set<String> set = new HashSet<>();

        for (int i = 0; i < inputNumber.length(); i++) {
            String s = inputNumber.substring(i, i + 1);
            guessNumerList.add(s);
            set.add(s);
        }

        if (set.size() != 3) {
            showMsg(getString(R.string.error), true);
            return;
        }

        int a = 0;
        int b = 0;

        for (int i = 0; i < guessNumerList.size(); i++) {
            int index = numList.indexOf(guessNumerList.get(i));

            if (index == -1) {
                continue;
            } else if (index == i) {
                a++;
            } else {
                b++;
            }
        }

        if (a == NUMBER_LENGTH) {
            showMsg("INPUT的數字" + inputNumber + " 恭喜你！答對了囉~答案：" + result, false);
        } else {
            showMsg("INPUT的數字：" + inputNumber + "=" + a + "A" + b + "B", true);
        }
    }

}
