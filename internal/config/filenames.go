package config

import (
	"fmt"
	"os"
	"os/exec"
	"path/filepath"

	"github.com/photoprism/photoprism/pkg/fs"
)

func findExecutable(configBin, defaultBin string) (result string) {
	if configBin == "" {
		result = defaultBin
	} else {
		result = configBin
	}

	if path, err := exec.LookPath(result); err == nil {
		result = path
	}

	if !fs.FileExists(result) {
		result = ""
	}

	return result
}

// CreateDirectories creates directories for storing photos, metadata and cache files.
func (c *Config) CreateDirectories() error {
	createError := func(path string, err error) (result error) {
		if fs.FileExists(path) {
			result = fmt.Errorf("\"%s\" is a file, not a directory: please check your configuration", path)
		} else {
			result = fmt.Errorf("can't create \"%s\": please check configuration and permissions", path)
		}

		log.Debug(err)

		return result
	}

	if err := os.MkdirAll(c.OriginalsPath(), os.ModePerm); err != nil {
		return createError(c.OriginalsPath(), err)
	}

	if err := os.MkdirAll(c.ImportPath(), os.ModePerm); err != nil {
		return createError(c.ImportPath(), err)
	}

	if err := os.MkdirAll(c.ExportPath(), os.ModePerm); err != nil {
		return createError(c.ExportPath(), err)
	}

	if err := os.MkdirAll(c.TempPath(), os.ModePerm); err != nil {
		return createError(c.TempPath(), err)
	}

	if err := os.MkdirAll(c.ThumbnailsPath(), os.ModePerm); err != nil {
		return createError(c.ThumbnailsPath(), err)
	}

	if err := os.MkdirAll(c.ResourcesPath(), os.ModePerm); err != nil {
		return createError(c.ResourcesPath(), err)
	}

	if err := os.MkdirAll(c.DatabasePath(), os.ModePerm); err != nil {
		return createError(c.DatabasePath(), err)
	}

	if err := os.MkdirAll(c.TensorFlowModelPath(), os.ModePerm); err != nil {
		return createError(c.TensorFlowModelPath(), err)
	}

	if err := os.MkdirAll(c.HttpStaticBuildPath(), os.ModePerm); err != nil {
		return createError(c.HttpStaticBuildPath(), err)
	}

	if err := os.MkdirAll(filepath.Dir(c.PIDFilename()), os.ModePerm); err != nil {
		return createError(filepath.Dir(c.PIDFilename()), err)
	}

	if err := os.MkdirAll(filepath.Dir(c.LogFilename()), os.ModePerm); err != nil {
		return createError(filepath.Dir(c.LogFilename()), err)
	}

	return nil
}

// ConfigFile returns the config file name.
func (c *Config) ConfigFile() string {
	return c.config.ConfigFile
}

// SettingsFile returns the user settings file name.
func (c *Config) SettingsFile() string {
	return c.ConfigPath() + "/settings.yml"
}

// ConfigPath returns the config path.
func (c *Config) ConfigPath() string {
	if c.config.ConfigPath == "" {
		return c.AssetsPath() + "/config"
	}

	return fs.Abs(c.config.ConfigPath)
}

// PIDFilename returns the filename for storing the server process id (pid).
func (c *Config) PIDFilename() string {
	if c.config.PIDFilename == "" {
		return c.AssetsPath() + "/photoprism.pid"
	}

	return fs.Abs(c.config.PIDFilename)
}

// LogFilename returns the filename for storing server logs.
func (c *Config) LogFilename() string {
	if c.config.LogFilename == "" {
		return c.AssetsPath() + "/photoprism.log"
	}

	return fs.Abs(c.config.LogFilename)
}

// OriginalsPath returns the originals.
func (c *Config) OriginalsPath() string {
	return fs.Abs(c.config.OriginalsPath)
}

// ImportPath returns the import directory.
func (c *Config) ImportPath() string {
	return fs.Abs(c.config.ImportPath)
}

// ExportPath returns the export directory.
func (c *Config) ExportPath() string {
	return fs.Abs(c.config.ExportPath)
}

// SipsBin returns the sips binary file name.
func (c *Config) SipsBin() string {
	return findExecutable(c.config.SipsBin, "sips")
}

// DarktableBin returns the darktable-cli binary file name.
func (c *Config) DarktableBin() string {
	return findExecutable(c.config.DarktableBin, "darktable-cli")
}

// HeifConvertBin returns the heif-convert binary file name.
func (c *Config) HeifConvertBin() string {
	return findExecutable(c.config.HeifConvertBin, "heif-convert")
}

// ExifToolBin returns the exiftool binary file name.
func (c *Config) ExifToolBin() string {
	return findExecutable(c.config.ExifToolBin, "exiftool")
}

// TempPath returns a temporary directory name for uploads and downloads.
func (c *Config) TempPath() string {
	if c.config.TempPath == "" {
		return os.TempDir() + "/photoprism"
	}

	return fs.Abs(c.config.TempPath)
}

// CachePath returns the path to the cache.
func (c *Config) CachePath() string {
	return fs.Abs(c.config.CachePath)
}

// ThumbnailsPath returns the path to the cached thumbnails.
func (c *Config) ThumbnailsPath() string {
	return c.CachePath() + "/thumbnails"
}

// AssetsPath returns the path to the assets.
func (c *Config) AssetsPath() string {
	return fs.Abs(c.config.AssetsPath)
}

// ResourcesPath returns the path to the app resources like static files.
func (c *Config) ResourcesPath() string {
	if c.config.ResourcesPath == "" {
		return c.AssetsPath() + "/resources"
	}

	return fs.Abs(c.config.ResourcesPath)
}

// ExamplesPath returns the example files path.
func (c *Config) ExamplesPath() string {
	return c.ResourcesPath() + "/examples"
}

// TensorFlowModelPath returns the tensorflow model path.
func (c *Config) TensorFlowModelPath() string {
	return c.ResourcesPath() + "/nasnet"
}

// NSFWModelPath returns the NSFW tensorflow model path.
func (c *Config) NSFWModelPath() string {
	return c.ResourcesPath() + "/nsfw"
}
