Experiment() {
  Context() {
    AssignmentGroup() {
      ExperimentName = "Word Recognition";
      SubjectCode = "pxlab24";
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
	Trial(["rapa", "ropa"], 0, ?, ?);
	Trial(["gazza", "gassa"], 0, ?, ?);
	Trial(["tordo", "fordo"], 0, ?, ?);
	Trial(["zuffa", "tuvva"], 0, ?, ?);
	Trial(["fata", "vata"], 0, ?, ?);
	Trial(["sugo", "zugo"], 0, ?, ?);
	Trial(["lepre", "lebre"], 0, ?, ?);
	Trial(["norma", "morma"], 0, ?, ?);
	Trial(["talpa", "talba"], 0, ?, ?);
	Trial(["rovo", "rofo"], 0, ?, ?);
	Trial(["tuta", "duta"], 0, ?, ?);
	Trial(["asma", "esma"], 0, ?, ?);
	Trial(["pala", "bala"], 0, ?, ?);
	Trial(["rata", "reta"], 0, ?, ?);
	Trial(["ghiro", "digo"], 0, ?, ?);
	Trial(["goppa", "gobba"], 1, ?, ?);
	Trial(["zudda", "zuppa"], 1, ?, ?);
	Trial(["bafa", "bava"], 1, ?, ?);
	Trial(["voca", "foca"], 1, ?, ?);
	Trial(["buga", "ruga"], 1, ?, ?);
	Trial(["pelva", "belva"], 1, ?, ?);
	Trial(["brago", "drago"], 1, ?, ?);
	Trial(["carbo", "garbo"], 1, ?, ?);
	Trial(["gagno", "ragno"], 1, ?, ?);
	Trial(["cufo", "gufo"], 1, ?, ?);
	Trial(["etrio", "atrio"], 1, ?, ?);
	Trial(["gorvo", "corvo"], 1, ?, ?);
	Trial(["vogna", "fogna"], 1, ?, ?);
	Trial(["nanzo", "manzo"], 1, ?, ?);
	Trial(["frave", "trave"], 1, ?, ?);
      }
    }
  }
}
