/* ** *****************************************************************
* ncurseswin.h
*
* Author: Mauricio Matamoros
*
* ** *****************************************************************/
/** @file ncurseswin.h
 * Definition of the NCursesWin class: the main window of the clipscontrol
 */

#ifndef __NCURSES_WIN_H__
#define __NCURSES_WIN_H__
#pragma once

/** @cond */
#include <list>
#include <tuple>
#include <string>
#include <vector>
#include <functional>
#include <locale.h>
#include <ncurses.h>
#include "namespace.h"
#include "ncursesdialogwin.h"
/** @endcond */
#include "hotkey.h"

BEGIN_NAMESPACE

typedef std::function<void(const std::string& c, const std::string& a)> commandfunc;
typedef std::function<bool(const std::string& q, std::string& r)> queryfunc;


/**
 * Implements the main window of the clipscontrol node using NCurses.
 * Should be instantiated only once. Singleton is not implemented.
 */
class NCursesWin{
public:
	/**
	 * Minimum number of columns the GUI accepts (used for calculations)
	 */
	static const int MINCOLS = 60;

public:
	/**
	 * Initializes a new instance of NCursesWin
	 */
	NCursesWin();
	~NCursesWin();

public:
	/**
	 * Defines the status of the rosclips node as:
	 * offline, online, and unknown
	 */
	enum class CLIPSStatus{
		Offline = 0,
		Online  = 1,
		Unknown = 2
	};

private:
	enum class KPMode{
		Default    = 0,
		Input      = 1,
		LogLvl     = 2,
		TglWatches = 3,
		Dialog     = 4
	};

	enum class WatchStatus{
		Enabled  = 1,
		Disabled = 2,
		Unknown  = 3
	};

	enum class InputAction{
		None,
		Load,
		Assert,
		RawCmd,
		Run,
		Path,
		Query,
	};

public:
	/**
	 * Runs the GUI main loop, blocking until it is closed either by
	 * user's request or by a call to the exitPoll() method.
	 */
	void poll();

	/**
	 * Request termination of the GUI main loop.
	 */
	void exitPoll();


	/**
	 * Adds a command handler function.
	 * Commands for ClipsServer will be issued tothis function
	 * @remark  The function must be of type
	 *          bool(const std::string& command, const std::string& args).
	 *
	 * @param f The function to register.
	 */
	void addCommandHandler(const commandfunc& f);

	/**
	 * Adds a query handler function.
	 * Queries will be issued to this function.
	 *
	 * Query functions receive a string to be injected-to/executed-by
	 * CLIPS and return the output yield by it.
	 * @remark  The function must be of type
	 *          bool(const std::string&,std::string&).
	 * @param f The function to register.
	 */
	void addQueryHandler(const queryfunc& f);

	/**
	 * Sets the Watch flags
	 * @param flags [description]
	 */
	void setWatchFlags(int flags);

	/**
	 * Gets the current working path of ClipsServer
	 */
	std::string getServerPath();

	/**
	 * Sets the current working path of ClipsServer
	 * @param path The current working path of ClipsServer
	 */
	void setServerPath(const std::string& path);


	/**
	 * Sets the status of the rosclips node
	 * @param status The status of CLIPSServer
	 */
	void setCLIPSStatus(const CLIPSStatus& status);

	/**
	 * Prints the provided string into the GUI main window
	 * @param s The string to print
	 */
	void print(const std::string& s);
	// void removePublisher(const pubfunc& f);

private:
	void createWindows();
	void destroyWindows();
	void resetBottomDefault();
	void resetBottomInput(const std::string& prompt);
	void resetBottomLogLevel();
	void resetBottomMenu1();
	void resetBottomMenu2();
	void resetBottomTglWatches();
	void resize();
	void updateTop();
	void updateTopL();
	void updateTopC();
	void updateTopR();
	void updateBottom(const std::string& title, const std::vector<hotkey>& options);
	void updateWatch(size_t xpos, size_t colw, const std::string& wname, const WatchStatus& color);
	void updateWatches(bool refresh=false);
	void printmid(const std::string& str, const bool& log = true);
	void printBottomOptions(const std::vector<hotkey>& options);
	void handleKeyDefault(const uint32_t& c);
	void handleKeyDialog(const uint32_t& c);
	void handleKeyInput(const uint32_t& c);
	void handleKeyLogLvl(const uint32_t& c);
	void handleKeyTglWatches(const uint32_t& c);
	void shiftToDefaultMode();
	void shiftToDialogMode();
	void shiftToInputMode(const std::string& prompt, bool numeric=false);
	void shiftToLogLvlMode();
	void shiftToToggleWatchesMode();
	void handleInputBS();
	void handleInputNL();
	void savePreviousInput();


	void sendAssert(const std::string& fact);
	void sendClear();
	void sendCommand(const std::string& cmd);
	void sendLoad(const std::string& file);
	void sendLogLvl(uint8_t lvl);
	void sendPath(const std::string& path);
	void sendPrintAgenda();
	void sendPrintFacts();
	void sendPrintRules();
	void sendRun(int n);
	void sendReset();
	void sendWatchFunc();
	void sendWatchGlob();
	void sendWatchFacts();
	void sendWatchRules();
	void performQuery(const std::string& s);
	void execute(const std::string& cmd, const std::string& args="");

private:
	bool exit;
	WINDOW *top;
	WINDOW *mid;
	WINDOW *bottom;
	NCursesDialogWin* dia;
	KPMode currMod;
	CLIPSStatus clipsStatus;
	std::string headingL;
	std::string headingR;
	std::string headingC;
	std::string inputPrompt;
	std::string inputBuffer;
	bool inputNumericOnly;
	commandfunc commandHandler;
	queryfunc queryHandler;
	std::string cmdstrbase;
	InputAction inputAction;
	int watchFlags;
	bool trimLines;
	std::list<std::string> history;
	std::string prevCmd;
	std::string prevFact;
	std::string prevLdFile;
	std::string serverPath;
	std::string prevQuery;
	int runN;
	int quickMenuIndex;

};

END_NAMESPACE

#endif // __NCURSES_WIN_H__