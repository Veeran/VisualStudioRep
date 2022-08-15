public class CS_Taskhandler{

public static void taskhandler(list<case>cases){
list<task>tasks = new list<task>();
for(Case c:cases){
// Create a New Task When Case Gets Created in Salesforce Automatically
Task tsk = New Task();
tsk.whatid = c.id;
tsk.whoid = c.ContactId;
tsk.status = 'Not started';
tsk.subject = 'Welcome call for ' + c.CaseNumber;
tsk.priority = 'Normal';
tsk.OwnerId = c.OwnerId;
if(c.Priority == 'High'){
tsk.ActivityDate = DATE.TODAY()+7;
}
if(c.Priority == 'Medium'){
tsk.ActivityDate = DATE.TODAY()+14;
}
if(c.Priority == 'Low'){
tsk.ActivityDate = DATE.TODAY()+21;
}
tasks.add(tsk);
system.debug('Due Date' + tsk.ReminderDateTime );
}
if(tasks.size()>0){
insert tasks;

}
}
}