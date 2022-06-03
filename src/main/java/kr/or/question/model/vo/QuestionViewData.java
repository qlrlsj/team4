package kr.or.question.model.vo;
import kr.or.comment.model.vo.Comment;
import java.util.ArrayList;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class QuestionViewData {
	private Question q; //게시글 정보를 담고있는 객체
	private Comment c;	//코멘트 정보를 담고있는 객체
}
