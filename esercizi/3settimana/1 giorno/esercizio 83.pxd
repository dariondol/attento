Experiment() {
  Context() {
    AssignmentGroup() {
      ExperimentName = "Word Recognition";
      SubjectCode = "pxlab83";
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
	Trial(["favola", "tafola"], 0, ?, ?);
	Trial(["galera", "calera"], 0, ?, ?);
	Trial(["rumore", "runore"], 0, ?, ?);
	Trial(["canzone", "cansone"], 0, ?, ?);
	Trial(["coltello", "goltello"], 0, ?, ?);
	Trial(["polvere", "bolvere"], 0, ?, ?);
	Trial(["negozio", "megozio"], 0, ?, ?);
	Trial(["cervello", "gervello"], 0, ?, ?);
	Trial(["angolo", "engolo"], 0, ?, ?);
	Trial(["epoca", "apoca"], 0, ?, ?);
	Trial(["bestia", "destia"], 0, ?, ?);
	Trial(["fiducia", "viducia"], 0, ?, ?);
	Trial(["giudice", "ciudice"], 0, ?, ?);
	Trial(["castello", "gastello"], 0, ?, ?);
	Trial(["bicchiere", "dicchiere"], 0, ?, ?);
	Trial(["engolo", "angolo"], 1, ?, ?);
	Trial(["viducia", "fiducia"], 1, ?, ?);
	Trial(["ergento", "argento"], 1, ?, ?);
	Trial(["barola", "parola"], 1, ?, ?);
	Trial(["astate", "estate"], 1, ?, ?);
	Trial(["cargere", "carcere"], 1, ?, ?);
	Trial(["mafura", "natura"], 1, ?, ?);
	Trial(["davolo", "tavolo"], 1, ?, ?);
	Trial(["barola", "parola"], 1, ?, ?);
	Trial(["officio", "ufficio"], 1, ?, ?);
	Trial(["benaro", "denaro"], 1, ?, ?);
	Trial(["gavallo", "cavallo"], 1, ?, ?);
	Trial(["machina", "macchina"], 1, ?, ?);
	Trial(["adore", "odore"], 1, ?, ?);
	Trial(["nibote", "nipote"], 1, ?, ?);
      }
    }
  }
}
