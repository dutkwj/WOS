import org.thealpha.model.Scholar;

import java.io.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class Test{

    @org.junit.Test
    public void testSort() {
        Scholar s1 = new Scholar();
        Scholar s2 = new Scholar();
        Scholar s3 = new Scholar();
        Scholar s4 = new Scholar();
        s1.setHindex(10);
        s2.setHindex(5);
        s3.setHindex(20);
        ArrayList<Scholar> scholars = new ArrayList<Scholar>();
        scholars.add(s4);

        scholars.add(s1);
        scholars.add(s2);
        scholars.add(s3);

        Collections.sort(scholars, new Comparator<Scholar>() {
            public int compare(Scholar o1, Scholar o2) {
                if (o1.getHindex() > o2.getHindex()) {
                    return -1;
                } else if (o1.getHindex() < o2.getHindex()) {
                    return 1;
                }
                return 0;
            }
        });
        for(int i = 0; i < 4; i++) {
            System.out.println(scholars.get(i).getHindex());

        }
        for (Scholar scholar : scholars) {
            System.out.println(scholar.getHindex());
        }
    }

    @org.junit.Test
    public void testReplace() {
        String str = "ad.asdas*sdas";
        System.out.println(str.replaceAll("\\*|\\.", ""));
    }

    @org.junit.Test
    public void testImg() {
        File file = new File("");
        System.out.println(file.getPath());
        System.out.println(file.toURI().getPath());

        System.out.println(file.exists());
        System.out.println(file.getAbsolutePath());
    }

    @org.junit.Test
    public void testReadCsv() throws IOException {
        File csv = new File("/home/kangwenjie/PycharmProjects/WOS/MS-DATA/file/cs_index_lat_lng.csv");
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader(csv));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        String line = "";
        int count = 0;
        try {
            while ((line = br.readLine()) != null)
            {
                count += 1;
                String latlng = line.substring(line.indexOf(",") + 1);
                latlng = latlng.replaceAll("\"", "");
                int commaIndex = latlng.indexOf(", ");

                System.out.println(latlng.substring(0, commaIndex));
                System.out.println(latlng.substring(commaIndex + 1));
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            br.close();
        }
    }
}
