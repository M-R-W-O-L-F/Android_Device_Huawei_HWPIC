package org.cyanogenmod.hardware;

import org.cyanogenmod.internal.util.FileUtils;

/**
 * Glove mode / high touch sensitivity
 */
public class HighTouchSensitivity {

    private static final String GLOVE_PATH = "/sys/touchscreen/touch_glove";

    private static final String ENABLED = "1";
    private static final String DISABLED = "0";

    /**
     * Whether device supports high touch sensitivity.
     *
     * @return boolean Supported devices must return always true
     */
    public static boolean isSupported() {
        return FileUtils.isFileReadable(GLOVE_PATH) &&
                FileUtils.isFileWritable(GLOVE_PATH);
    }

    /**
     * This method return the current activation status of high touch sensitivity
     *
     * @return boolean Must be false if high touch sensitivity is not supported or not activated,
     * or the operation failed while reading the status; true in any other case.
     */
    public static boolean isEnabled() {
	return ENABLED.equals(FileUtils.readOneLine(GLOVE_PATH));
    }

    /**
     * This method allows to setup high touch sensitivity status.
     *
     * @param status The new high touch sensitivity status
     * @return boolean Must be false if high touch sensitivity is not supported or the operation
     * failed; true in any other case.
     */
    public static boolean setEnabled(boolean status) {
        return FileUtils.writeLine(GLOVE_PATH, status ? ENABLED : DISABLED);
    }

}