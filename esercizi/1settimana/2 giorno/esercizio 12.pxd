Experiment() {
  Context() {
    AssignmentGroup() {
      ExperimentName = "Word Recognition";
      SubjectCode = "pxlab12";
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
	LocationX = arrayOf2(-screenWidth()/8.2, screenWidth()/8.2);
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
	Trial(["rapa", "rOpa"], 0, ?, ?);
	Trial(["gazza", "gaSSa"], 0, ?, ?);
	Trial(["tordo", "Fordo"], 0, ?, ?);
	Trial(["zuffa", "tuVVa"], 0, ?, ?);
	Trial(["fata", "Vata"], 0, ?, ?);
	Trial(["sugo", "Zugo"], 0, ?, ?);
	Trial(["lepre", "leBre"], 0, ?, ?);
	Trial(["norma", "Morma"], 0, ?, ?);
	Trial(["talpa", "talBa"], 0, ?, ?);
	Trial(["rovo", "roFo"], 0, ?, ?);
	Trial(["tuta", "Duta"], 0, ?, ?);
	Trial(["asma", "Esma"], 0, ?, ?);
	Trial(["pala", "Bala"], 0, ?, ?);
	Trial(["rata", "rEta"], 0, ?, ?);
	Trial(["ghiro", "digo"], 0, ?, ?);
	Trial(["goPPa", "gobba"], 1, ?, ?);
	Trial(["ZUddA", "zuppa"], 1, ?, ?);
	Trial(["BAfA", "bava"], 1, ?, ?);
	Trial(["Voca", "foca"], 1, ?, ?);
	Trial(["Buga", "ruga"], 1, ?, ?);
	Trial(["Pelva", "belva"], 1, ?, ?);
	Trial(["Brago", "drago"], 1, ?, ?);
	Trial(["Carbo", "garbo"], 1, ?, ?);
	Trial(["gAGNO", "ragno"], 1, ?, ?);
	Trial(["cUFO", "gufo"], 1, ?, ?);
	Trial(["eTRIO", "atrio"], 1, ?, ?);
	Trial(["gORVO", "corvo"], 1, ?, ?);
	Trial(["vOGNA", "fogna"], 1, ?, ?);
	Trial(["nANZO", "manzo"], 1, ?, ?);
	Trial(["fRAVE", "trave"], 1, ?, ?);
      }
    }
  }
}
