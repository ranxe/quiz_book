import 'dart:convert';

Problem problemFromJson(String str) => Problem.fromJson(json.decode(str));

String problemToJson(Problem data) => json.encode(data.toJson());

class Problem {
    Problem({
        required this.id,
        required this.workbookId,
        required this.isReview,
        required this.question,
        required this.answer,
        this.hint,
        this.picture,
    });

    int id;
    int workbookId;
    bool isReview;
    String question;
    String answer;
    String? hint;
    String? picture;

    factory Problem.fromJson(Map<String, dynamic> json) => Problem(
        id: json["id"],
        workbookId: json["workbook_id"],
        isReview: json["is_review"],
        question: json["question"],
        answer: json["answer"],
        hint: json["hint"],
        picture: json["picture"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "workbook_id": workbookId,
        "is_review": isReview,
        "question": question,
        "answer": answer,
        "hint": hint,
        "picture": picture,
    };
}