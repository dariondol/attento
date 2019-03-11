Experiment() {
  Context() {
    AssignmentGroup() {
      ExperimentName = "Word Recognition";
      SubjectCode = "pxlab171";
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
	Trial(["RAPA", "ROPA"], 0, ?, ?);
	Trial(["GAZZA", "GASSA"], 0, ?, ?);
	Trial(["TORDO", "FORDO"], 0, ?, ?);
	Trial(["ZUFFA", "TUVVA"], 0, ?, ?);
	Trial(["FATA", "VATA"], 0, ?, ?);
	Trial(["SUGO", "ZUGO"], 0, ?, ?);
	Trial(["LEPRE", "LEBRE"], 0, ?, ?);
	Trial(["NORMA", "MORMA"], 0, ?, ?);
	Trial(["TALPA", "TALBA"], 0, ?, ?);
	Trial(["ROVO", "ROFO"], 0, ?, ?);
	Trial(["TUTA", "DUDA"], 0, ?, ?);
	Trial(["ASMA", "ESMA"], 0, ?, ?);
	Trial(["PALA", "BALA"], 0, ?, ?);
	Trial(["RATA", "GATA"], 0, ?, ?);
	Trial(["GHIRO", "DIGO"], 0, ?, ?);
	Trial(["GOPPA", "GOBBA"], 1, ?, ?);
	Trial(["ZUDDA", "ZUPPA"], 1, ?, ?);
	Trial(["BAFA", "BAVA"], 1, ?, ?);
	Trial(["VOCA", "FOCA"], 1, ?, ?);
	Trial(["BUGA", "RUGA"], 1, ?, ?);
	Trial(["PELVA", "BELVA"], 1, ?, ?);
	Trial(["BIAGO", "DRAGO"], 1, ?, ?);
	Trial(["CARBO", "GARBO"], 1, ?, ?);
	Trial(["GAGNO", "RAGNO"], 1, ?, ?);
	Trial(["CUFO", "GUFO"], 1, ?, ?);
	Trial(["ETRIO", "ATRIO"], 1, ?, ?);
	Trial(["GORVO", "CORVO"], 1, ?, ?);
	Trial(["VOGNA", "FOGNA"], 1, ?, ?);
	Trial(["NANZO", "MANZO"], 1, ?, ?);
	Trial(["FRAVE", "TRAVE"], 1, ?, ?);
      }
    }
  }
}
