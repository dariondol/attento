Experiment() {
  Context() {
    AssignmentGroup() {
      ExperimentName = "Word Recognition";
      SubjectCode = "pxlab173";
    }

    Session() {
      Instruction() {
        Text = ["Word or Not?",
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
	Trial(["episodio", "apisodio"], 0, ?, ?);
	Trial(["edicola", "adicola"], 0, ?, ?);
	Trial(["origine", "origgine"], 0, ?, ?);
	Trial(["cadavere", "gadavere"], 0, ?, ?);
	Trial(["elefante", "alefante"], 0, ?, ?);
	Trial(["galleria", "galerie"], 0, ?, ?);
	Trial(["immagine", "imagine"], 0, ?, ?);
	Trial(["incudine", "ingudine"], 0, ?, ?);
	Trial(["indagine", "indacine"], 0, ?, ?);
	Trial(["maionese", "naionese"], 0, ?, ?);
	Trial(["officina", "afficina"], 0, ?, ?);
	Trial(["ombelico", "omdelico"], 0, ?, ?);
	Trial(["ospedale", "ospebale"], 0, ?, ?);
	Trial(["pericolo", "bericolo"], 0, ?, ?);
	Trial(["piramide", "biramide"], 0, ?, ?);
	Trial(["dattesimo", "battesimo"], 1, ?, ?);
	Trial(["asignolo", "usignolo"], 1, ?, ?);
	Trial(["religgione", "religione"], 1, ?, ?);
	Trial(["occibente", "occidente"], 1, ?, ?);
	Trial(["orienfale", "orientale"], 1, ?, ?);
	Trial(["orissonte", "orizzonte"], 1, ?, ?);
	Trial(["bontefice", "pontefice"], 1, ?, ?);
	Trial(["rupinetto", "rubinetto"], 1, ?, ?);
	Trial(["sacerpote", "sacerdote"], 1, ?, ?);
	Trial(["farfaruga", "tartaruga"], 1, ?, ?);
	Trial(["fertigine", "vertigine"], 1, ?, ?);
	Trial(["lapirinto", "labirinto"], 1, ?, ?);
	Trial(["intaresse", "interesse"], 1, ?, ?);
	Trial(["ghelsomino", "gelsomino"], 1, ?, ?);
	Trial(["municibio", "municipio"], 1, ?, ?);
      }
    }
  }
}
