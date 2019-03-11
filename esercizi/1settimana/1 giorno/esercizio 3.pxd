Experiment() {
  Context() {
    AssignmentGroup() {
      ExperimentName = "Word Recognition";
      SubjectCode = "pxlab3";
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
	CorrectText = "Correto!\n %Trial.TextParagraphMultiple.ResponseTime@i% ms";
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
	Trial(["episodio", "APISODIO"], 0, ?, ?);
	Trial(["edicola", "ADICOLA"], 0, ?, ?);
	Trial(["origine", "ORIGGINE"], 0, ?, ?);
	Trial(["cadavere", "GADAVERE"], 0, ?, ?);
	Trial(["elefante", "ALEFANTE"], 0, ?, ?);
	Trial(["galleria", "GALERIA"], 0, ?, ?);
	Trial(["immagine", "IMAGINE"], 0, ?, ?);
	Trial(["incudine", "INGUDINE"], 0, ?, ?);
	Trial(["indagine", "INDACINE"], 0, ?, ?);
	Trial(["maionese", "NAIONESE"], 0, ?, ?);
	Trial(["officina", "AFFICINA"], 0, ?, ?);
	Trial(["ombelico", "ONDELICO"], 0, ?, ?);
	Trial(["ospedale", "OSPEBALE"], 0, ?, ?);
	Trial(["pericolo", "BERICOLO"], 0, ?, ?);
	Trial(["piramide", "BIRAMIDE"], 0, ?, ?);
	Trial(["DATTESIMO", "battesimo"], 1, ?, ?);
	Trial(["ASIGNOLO", "usignolo"], 1, ?, ?);
	Trial(["RELIGGIONE", "religione"], 1, ?, ?);
	Trial(["OCCIBENTE", "occidente"], 1, ?, ?);
	Trial(["ORIENFALE", "orientale"], 1, ?, ?);
	Trial(["ORISSONTE", "orizzonte"], 1, ?, ?);
	Trial(["BONTEFICE", "pontefice"], 1, ?, ?);
	Trial(["RUPINETTO", "rubinetto"], 1, ?, ?);
	Trial(["SACERPOTE", "sacerdote"], 1, ?, ?);
	Trial(["FARFARUGA", "tartaruga"], 1, ?, ?);
	Trial(["FERTIGINE", "vertigine"], 1, ?, ?);
	Trial(["LAPIRINTO", "labirinto"], 1, ?, ?);
	Trial(["INTARESSE", "interesse"], 1, ?, ?);
	Trial(["GHELSOMINO", "gelsomino"], 1, ?, ?);
	Trial(["MUNICIBIO", "municipio"], 1, ?, ?);
      }
    }
  }
}
