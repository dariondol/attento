Experiment() {
  Context() {
    AssignmentGroup() {
      ExperimentName = "Word Recognition";
      SubjectCode = "pxlab111";
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
	Trial(["batuffolo", "patuffolo"], 0, ?, ?);
	Trial(["arsenale", "ersenale"], 0, ?, ?);
	Trial(["calamita", "galamita"], 0, ?, ?);
	Trial(["cocomero", "gogomero"], 0, ?, ?);
	Trial(["calamita", "galamita"], 0, ?, ?);
	Trial(["camomilla", "gamomilla"], 0, ?, ?);
	Trial(["caramella", "caramela"], 0, ?, ?);
	Trial(["cicatrice", "gigatrice"], 0, ?, ?);
	Trial(["vertigine", "fertigine"], 0, ?, ?);
	Trial(["carosello", "garosello"], 0, ?, ?);
	Trial(["intestino", "instastino"], 0, ?, ?);
	Trial(["cucchiaio", "cugghiaio"], 0, ?, ?);
	Trial(["ergastolo", "ercastolo"], 0, ?, ?);
	Trial(["magazzino", "macazzino"], 0, ?, ?);
	Trial(["proverbio", "broverbio"], 0, ?, ?);
	Trial(["satelite", "satellite"], 1, ?, ?);
	Trial(["monasfero", "monastero"], 1, ?, ?);
	Trial(["ringiera", "ringhiera"], 1, ?, ?);
	Trial(["bersalio", "bersaglio"], 1, ?, ?);
	Trial(["galvario", "calvario"], 1, ?, ?);
	Trial(["uracano", "uragano"], 1, ?, ?);
	Trial(["teremoto", "terremoto"], 1, ?, ?);
	Trial(["farfaruga", "tartaruga"], 1, ?, ?);
	Trial(["ciaguaro", "giaguaro"], 1, ?, ?);
	Trial(["sagerdote", "sacerdote"], 1, ?, ?);
	Trial(["vertighine", "vertigine"], 1, ?, ?);
	Trial(["ghelsomino", "gelsomino"], 1, ?, ?);
	Trial(["interesa", "interesse"], 1, ?, ?);
	Trial(["intastino", "intestino"], 1, ?, ?);
	Trial(["lugertola", "lucertola"], 1, ?, ?);
      }
    }
  }
}
