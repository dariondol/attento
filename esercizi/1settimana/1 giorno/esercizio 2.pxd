Experiment() {
  Context() {
    AssignmentGroup() {
      ExperimentName = "Word Recognition";
      SubjectCode = "pxlab2";
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
	LocationX = arrayOf2(-screenWidth()/16.4, screenWidth()/16.4);
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
	Trial(["pomata", "BOMATA"], 0, ?, ?);
	Trial(["bossolo", "DOSSOLO"], 0, ?, ?);
	Trial(["forfora", "VORVORA"], 0, ?, ?);
	Trial(["valvola", "FALVOLA"], 0, ?, ?);
	Trial(["carciofo", "GARGIOFO"], 0, ?, ?);
	Trial(["ciliegia", "CHILIEGIA"], 0, ?, ?);
	Trial(["giaguaro", "GUACARO"], 0, ?, ?);
	Trial(["pinguino", "BINGUINO"], 0, ?, ?);
	Trial(["befana", "PEFANA"], 0, ?, ?);
	Trial(["tariffa", "FARIFFA"], 0, ?, ?);
	Trial(["tassello", "DASSELLO"], 0, ?, ?);
	Trial(["cinghiale", "GINGHIALE"], 0, ?, ?);
	Trial(["catino", "GATINO"], 0, ?, ?);
	Trial(["cofano", "COTANO"], 0, ?, ?);
	Trial(["lumaca", "LUMATA"], 0, ?, ?);
	Trial(["ORTIGA", "ortica"], 1, ?, ?);
	Trial(["CABARRA", "caparra"], 1, ?, ?);
	Trial(["GRATERE", "cratere"], 1, ?, ?);
	Trial(["SANZARA", "zanzara"], 1, ?, ?);
	Trial(["ZAFFERA", "zattera"], 1, ?, ?);
	Trial(["GALCAGNO", "calcagno"], 1, ?, ?);
	Trial(["SGAFFALE", "scaffale"], 1, ?, ?);
	Trial(["GOMETA", "cometa"], 1, ?, ?);
	Trial(["GANGURO", "canguro"], 1, ?, ?);
	Trial(["OFATTA", "ovatta"], 1, ?, ?);
	Trial(["ADICOLA", "edicola"], 1, ?, ?);
	Trial(["FURCONE", "furgone"], 1, ?, ?);
	Trial(["CERANIO", "geranio"], 1, ?, ?);
	Trial(["NARTIRE", "martire"], 1, ?, ?);
	Trial(["GIPRESSO", "cipresso"], 1, ?, ?);
      }
    }
  }
}
