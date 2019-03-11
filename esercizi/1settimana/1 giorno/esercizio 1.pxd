Experiment() {
  Context() {
    AssignmentGroup() {
      ExperimentName = "Word Recognition";
      SubjectCode = "pxlab1";
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
	Trial(["rapa", "ROPA"], 0, ?, ?);
	Trial(["gazza", "GASSA"], 0, ?, ?);
	Trial(["tordo", "FORDO"], 0, ?, ?);
	Trial(["zuffa", "TUVVA"], 0, ?, ?);
	Trial(["fata", "VATA"], 0, ?, ?);
	Trial(["sugo", "ZUGO"], 0, ?, ?);
	Trial(["lepre", "LEBRE"], 0, ?, ?);
	Trial(["norma", "MORMA"], 0, ?, ?);
	Trial(["talpa", "TALBA"], 0, ?, ?);
	Trial(["rovo", "ROFO"], 0, ?, ?);
	Trial(["tuta", "DUDA"], 0, ?, ?);
	Trial(["asma", "ESMA"], 0, ?, ?);
	Trial(["pala", "BALA"], 0, ?, ?);
	Trial(["rata", "GATA"], 0, ?, ?);
	Trial(["ghiro", "DIGO"], 0, ?, ?);
	Trial(["GOPPA", "gobba"], 1, ?, ?);
	Trial(["ZUDDA", "zuppa"], 1, ?, ?);
	Trial(["BAFA", "bava"], 1, ?, ?);
	Trial(["VOCA", "foca"], 1, ?, ?);
	Trial(["BUGA", "ruga"], 1, ?, ?);
	Trial(["PELVA", "belva"], 1, ?, ?);
	Trial(["BIAGO", "drago"], 1, ?, ?);
	Trial(["CARBO", "garbo"], 1, ?, ?);
	Trial(["GAGNO", "ragno"], 1, ?, ?);
	Trial(["CUFO", "gufo"], 1, ?, ?);
	Trial(["ETRIO", "atrio"], 1, ?, ?);
	Trial(["GORVO", "corvo"], 1, ?, ?);
	Trial(["VOGNA", "fogna"], 1, ?, ?);
	Trial(["NANZO", "manzo"], 1, ?, ?);
	Trial(["FRAVE", "trave"], 1, ?, ?);
      }
    }
  }
}
