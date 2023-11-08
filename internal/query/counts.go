package query

import "github.com/photoprism/photoprism/internal/entity"

type Counts struct {
	Cameras        int `json:"cameras"`
	Lenses         int `json:"lenses"`
	Countries      int `json:"countries"`
	Photos         int `json:"photos"`
	Videos         int `json:"videos"`
	Hidden         int `json:"hidden"`
	Favorites      int `json:"favorites"`
	Private        int `json:"private"`
	Review         int `json:"review"`
	Stories        int `json:"stories"`
	Albums         int `json:"albums"`
	Folders        int `json:"folders"`
	Files          int `json:"files"`
	Moments        int `json:"moments"`
	Places         int `json:"places"`
	Labels         int `json:"labels"`
	LabelMaxPhotos int `json:"labelMaxPhotos"`
}

// Refresh updates the counts.
func (c *Counts) Refresh() {
	Db().Table("cameras").
		Where("camera_slug <> 'zz' AND camera_slug <> ''").
		Select("COUNT(*) AS cameras").
		Take(c)

	Db().Table("lenses").
		Where("lens_slug <> 'zz' AND lens_slug <> ''").
		Select("COUNT(*) AS lenses").
		Take(c)

	Db().Table("photos").
		Select("COALESCE(SUM(CASE WHEN photo_type = 'video' AND photo_quality > -1 AND photo_private = false THEN 1 END)) AS videos, " +
			"COALESCE(SUM(CASE WHEN photo_quality > -1 AND photo_quality < 3 AND photo_private = false THEN 1 END)) AS review, " +
			"COALESCE(SUM(CASE WHEN photo_quality = -1 THEN 1 END)) AS hidden, " +
			"COALESCE(SUM(CASE WHEN photo_type NOT IN ('live', 'video') AND photo_quality > -1 AND photo_private = false THEN 1 END)) AS photos, " +
			"COALESCE(SUM(CASE WHEN photo_favorite = true AND photo_private = false AND photo_quality > -1 THEN 1 END)) AS favorites, " +
			"COALESCE(SUM(CASE WHEN photo_private = true AND photo_quality > -1 THEN 1 END)) AS private").
		Where("photos.id NOT IN (SELECT photo_id FROM files WHERE file_primary = true AND (file_missing = true OR file_error <> ''))").
		Where("deleted_at IS NULL").
		Take(c)

	Db().Table("labels").
		Select("MAX(photo_count) as label_max_photos, COUNT(*) AS labels").
		Where("photo_count > 0").
		Where("deleted_at IS NULL").
		Where("(label_priority >= 0 OR label_favorite = true)").
		Take(c)

	Db().Table("albums").
		Select("COALESCE(SUM(CASE WHEN album_type = ? THEN 1 END)) AS albums, SUM(album_type = ?) AS moments, "+
			"COALESCE(SUM(CASE WHEN album_type = ? THEN 1 END)) AS folders",
			entity.AlbumManual, entity.AlbumMoment, entity.AlbumFolder).
		Where("deleted_at IS NULL").
		Take(c)

	Db().Table("files").
		Select("COUNT(*) AS files").
		Where("file_missing = false AND file_root = ?", entity.RootOriginals).
		Take(c)

	Db().Table("countries").
		Select("(COUNT(*) - 1) AS countries").
		Take(c)

	Db().Table("places").
		Select("COALESCE(SUM(CASE WHEN photo_count > 0 THEN 1 END)) AS places").
		Where("id <> 'zz'").
		Take(c)
}
