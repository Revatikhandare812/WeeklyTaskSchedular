package in.sp.backend;

public class Task {
// private String day;
 private String taskName;
 private String startTime;
 private String endTime;

 public Task(String taskName, String startTime, String endTime) {
//     this.day = day;
     this.taskName = taskName;
     this.startTime = startTime;
     this.endTime = endTime;
 }

// public String getDay() {
//     return day;
// }

 public String getTaskName() {
     return taskName;
 }

 public String getStartTime() {
     return startTime;
 }

 public String getEndTime() {
     return endTime;
 }
}
