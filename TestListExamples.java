import static org.junit.Assert.*;
import org.junit.*;
import java.util.Arrays;
import java.util.List;

class IsMoon implements StringChecker {
  public boolean checkString(String s) {
    return s.equalsIgnoreCase("moon");
  }
}


public class TestListExamples {
  @Test
  public void testFilter() {
      List<String> inputList = Arrays.asList("moon", "sun", "star", "moon", "planet");
      IsMoon isMoon = new IsMoon();

      List<String> expectedResult = Arrays.asList("moon", "moon");

      List<String> filteredList = ListExamples.filter(inputList, isMoon);

      assertEquals(expectedResult.size(), filteredList.size());
      for (String s : expectedResult) {
          assertTrue(filteredList.contains(s));
      }
  }
  
  @Test(timeout = 500)
  public void testMergeRightEnd() {
    List<String> left = Arrays.asList("a", "b", "c");
    List<String> right = Arrays.asList("a", "d");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "a", "b", "c", "d");
    assertEquals(expected, merged);
  }
}
