Experiment() {
  Context() {
    AssignmentGroup() {
      ExperimentName = "Word Recognition";
      SubjectCode = "pxlab148";
    }

    Session() {
      Instruction() {
        Text = ["PAROLA O NON PAROLA?",
		" ",
		"VEDRAI DUE SEQUENZE DI LETTERE. UNA E' UNA PAROLA VERA E L'ALTRA NON E' UNA PAROLA. DEVI TROVARE LA PAROLA VERA E CLICCARE IL TASTO DESTRO DEL MOUSE SE LA PAROLA VERA E' A DESTRA, IL TASTO DI SINISTRA SE LA PAROLA VERA E' A SINISTRA. CERCA DI ESSERE PIU' VELOCE CHE PUOI.",
		" ",
		"PREMI UN TASTO PER PARTIRE!"];  
      }
    }

    SessionEnd() {
      SessionEndMessage();
    }

    Trial(TextParagraphMultiple.Text, Feedback.CorrectCode, Feedback.Response, TextParagraphMultiple.ResponseTime) {
      FixationMark() {
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
        Duration = 50;
      }
      FixationMark:B() {
        Timer = de.pxlab.pxl.TimerCodes.NO_TIMER;
      }
      TextParagraphMultiple() {
	Overlay = de.pxlab.pxl.OverlayCodes.JOIN;
        Timer = de.pxlab.pxl.TimerCodes.RESPONSE_TIMER;
	ResponseSet = [1,3];
	FontSize = idiv(screenWidth(),15);
	ReferencePoint = [de.pxlab.pxl.PositionReferenceCodes.BASE_RIGHT, 
		de.pxlab.pxl.PositionReferenceCodes.BASE_LEFT];
	LocationX = arrayOf2(-screenWidth()/4.1, screenWidth()/4.1);
	LocationY = 25;
      }
      Feedback() {
	ResponseParameter = "Trial.TextParagraphMultiple.ResponseCode";
	CorrectText = "Corretto!\n %Trial.TextParagraphMultiple.ResponseTime@i% ms";
	FalseText = "Ops! Sbagliato!";
        Evaluation = de.pxlab.pxl.EvaluationCodes.COMPARE_CODE;
        Timer = de.pxlab.pxl.TimerCodes.CLOCK_TIMER;
	Duration = 1000;
      }
    }
  }

  Procedure() {
    Session() {
      Block() {
	Trial(["pomata", "bomata"], 0, ?, ?);
	Trial(["bossolo", "dossolo"], 0, ?, ?);
	Trial(["forfora", "vorvora"], 0, ?, ?);
	Trial(["valvola", "falfola"], 0, ?, ?);
	Trial(["carciofo", "gargiofo"], 0, ?, ?);
	Trial(["ciliegia", "chiliegia"], 0, ?, ?);
	Trial(["giaguaro", "guacuaro"], 0, ?, ?);
	Trial(["pinguino", "binguino"], 0, ?, ?);
	Trial(["befana", "pefana"], 0, ?, ?);
	Trial(["tariffa", "fatiffa"], 0, ?, ?);
	Trial(["tassello", "dassello"], 0, ?, ?);
	Trial(["cinghiale", "ginghiale"], 0, ?, ?);
	Trial(["catino", "gatino"], 0, ?, ?);
	Trial(["cofano", "gotano"], 0, ?, ?);
	Trial(["lumaca", "lumata"], 0, ?, ?);
	Trial(["ortiga", "ortica"], 1, ?, ?);
	Trial(["cabarra", "caparra"], 1, ?, ?);
	Trial(["gratere", "cratere"], 1, ?, ?);
	Trial(["sanzara", "zanzara"], 1, ?, ?);
	Trial(["zaffera", "zattera"], 1, ?, ?);
	Trial(["galcagno", "calcagno"], 1, ?, ?);
	Trial(["sgaffale", "scaffale"], 1, ?, ?);
	Trial(["gometa", "cometa"], 1, ?, ?);
	Trial(["ganguro", "canguro"], 1, ?, ?);
	Trial(["ofatta", "ovatta"], 1, ?, ?);
	Trial(["adicola", "edicola"], 1, ?, ?);
	Trial(["furcone", "furgone"], 1, ?, ?);
	Trial(["ceranio", "geranio"], 1, ?, ?);
	Trial(["nartire", "martire"], 1, ?, ?);
	Trial(["gipresso", "cipresso"], 1, ?, ?);
      }
    }
  }
}
