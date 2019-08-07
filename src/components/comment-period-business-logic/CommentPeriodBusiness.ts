export class CommentPeriodBusiness{
    combineText(information: String, description: String, currentProject: String): any {
     if (!information && !description) {
       return '';
     }
       let instructions = 'Comment Period on the '+ information + ' for ' + currentProject + '.' + '\n' + description;
       return instructions;
   }
 } 