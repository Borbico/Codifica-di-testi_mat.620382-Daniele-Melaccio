function evidenzia(area, bool){
	var chosen_area =  area.id;
    var chosen_area_half = chosen_area.split('r');
    var chosen_line = chosen_area_half[0] + '_r' + chosen_area_half[1];
	if(bool ==  true)
		document.getElementById(chosen_line).classList.add("evidenzia");
	else
		document.getElementById(chosen_line).classList.remove("evidenzia");

}

var person_organization_toggle = false;
var deleted_toggle = false;
var correction_toggle = false;
var regolarized_toggle = false;
var expanded_toggle = false;

function person_organization_function(btn) {
    var persons = document.querySelectorAll('.person');
    var organizations = document.querySelectorAll('.organization');
	var btns = document.getElementsByClassName(btn);
	var buttons = Array.from(btns);

    if (person_organization_toggle) {
        persons.forEach(function (person) {
            person.classList.remove('high');
        });
        organizations.forEach(function (organization) {
            organization.classList.remove('high');
        });
        person_organization_toggle = false;
		buttons.forEach(function (button) {
			button.classList.remove('clicked');
		});
    } else {
        persons.forEach(function (person) {
            person.classList.add('high');
        });
        organizations.forEach(function (organization) {
            organization.classList.add('high');
        });
        person_organization_toggle = true;
        buttons.forEach(function (button) {
			button.classList.add('clicked');
		});
    }
}

function deleted_function(btn) {
    var deleteds = document.querySelectorAll('.deleted');
	var addeds = document.querySelectorAll('.added');
	var btns = document.getElementsByClassName(btn);
	var buttons = Array.from(btns);

    if (deleted_toggle) {
        deleteds.forEach(function (deleted) {
            deleted.style.display = 'none';
        });
		addeds.forEach(function (added) {
			added.classList.remove('high');
		})
        deleted_toggle = false;
        buttons.forEach(function (button) {
			button.classList.remove('clicked');
		});
    } else {
        deleteds.forEach(function (deleted) {
            deleted.style.display = 'inline';
        });
		addeds.forEach(function (added) {
			added.classList.add('high');
		})
        deleted_toggle = true;
        buttons.forEach(function (button) {
			button.classList.add('clicked');
		});
    }
}

function correction_function(btn) {
    var corrections = document.querySelectorAll('.correction');
	var errors = document.querySelectorAll('.error')
	var btns = document.getElementsByClassName(btn);
	var buttons = Array.from(btns);

    if (correction_toggle) {
        corrections.forEach(function (correction) {
            correction.style.display = 'none';
        });
		errors.forEach(function (error) {
			error.classList.remove('through');
		})
        correction_toggle = false;
        buttons.forEach(function (button) {
			button.classList.remove('clicked');
		});
    } else {
        corrections.forEach(function (correction) {
            correction.style.display = 'inline';
        });
		errors.forEach(function (error) {
			error.classList.add('through');
		})
        correction_toggle = true;
        buttons.forEach(function (button) {
			button.classList.add('clicked');
		});
    }
}

function regolarized_function(btn) {
    var regolarizeds = document.querySelectorAll('.regolarized');
	var arcaics = document.querySelectorAll('.arcaic');
	var btns = document.getElementsByClassName(btn);
	var buttons = Array.from(btns);

    if (regolarized_toggle) {
        regolarizeds.forEach(function (regolarized) {
            regolarized.style.display = 'none';
        });
		arcaics.forEach(function (arcaic) {
			arcaic.classList.remove('through');
		})
        regolarized_toggle = false;
        buttons.forEach(function (button) {
			button.classList.remove('clicked');
		});
    } else {
        regolarizeds.forEach(function (regolarized) {
            regolarized.style.display = 'inline';
        });
		arcaics.forEach(function (arcaic) {
			arcaic.classList.add('through');
		})
        regolarized_toggle = true;
        buttons.forEach(function (button) {
			button.classList.add('clicked');
		});
    }
}

function expanded_function(btn) {
    var expandeds = document.querySelectorAll('.expanded');
	var shorts = document.querySelectorAll('.short');
	var btns = document.getElementsByClassName(btn);
	var buttons = Array.from(btns);

    if (expanded_toggle) {
        expandeds.forEach(function (expanded) {
            expanded.style.display = 'none';
        });
		shorts.forEach(function (short) {
			short.classList.remove('through');
		})
        expanded_toggle = false;
        buttons.forEach(function (button) {
			button.classList.remove('clicked');
		});
    } else {
        expandeds.forEach(function (expanded) {
            expanded.style.display = 'inline';
        });
		shorts.forEach(function (short) {
			short.classList.add('through');
		})
        expanded_toggle = true;
		buttons.forEach(function (button) {
			button.classList.add('clicked');
		});
    }
}

