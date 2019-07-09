/* utlib - Yet another wrapper to the YouTube Data API v3
 * Copyright (C) 2019 Nahuel Gomez Castro
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

namespace Utlib {

    /**
     * Basic details about a video, including title, description, uploader, thumbnails and category.
     */
    public class VideoSnippet : Object {

        /**
         * The date and time that the video was published.
         *
         * Note that this time might be different than the time that the video was uploaded. For example, if a video is
         * uploaded as a private video and then made public at a later time, this property will specify the time that
         * the video was made public.
         *
         * There are a couple of special cases:
         *
         *  * If a video is uploaded as a private video and the video metadata is retrieved by the channel owner, then the property value specifies the date and time that the video was uploaded.
         *  * If a video is uploaded as an unlisted video, the property value also specifies the date and time that the video was uploaded. In this case, anyone who knows the video's unique video ID can retrieve the video metadata.
         *
         * The value is specified in [[https://www.w3.org/TR/NOTE-datetime|ISO 8601]] (``YYYY-MM-DDYhh:mm:ss.sZ``) format.
         */
        public DateTime published_at { get; }

        /**
         * The ID that YouTube uses to uniquely identify the channel that the video was uploaded to.
         */
        public string? channel_id { get; }

        /**
         * The video's title.
         *
         * The property value has a maximum length of 100 characters and may contain all valid UTF-8 characters except
         * ``<`` and ``>``. You must set a value for this property if you call the {@link VideosResource.update}
         * method and are updating the {@link Video.snippet} part of a {@link Video} resource.
         */
        public string? title { get; }

        /**
         * The video's description.
         *
         * The property value has a maximum length of 5000 bytes and may contain all valid UTF-8 characters except ``<``
         * and ``>``.
         */
        public string? description { get; }

        /**
         * A map of thumbnails images associated with the video.
         *
         * For each object in the map, the key is the name of the thumbnail image, and the value is an object that
         * contains other information about the thumbnail.
         */
        public Gee.HashMap<string, Thumbnail> thumbnails { get; }

        /**
         * Channel title for the channel that the video belongs to.
         */
        public string? channel_title { get; }

        /**
         * A list of keyword tags associated with the video.
         *
         * Tags may contain spaces. The property value has a maximum length of 500 characters. Note the following rules
         * regarding the way the character limit is calculated:
         *
         *  * The property value is a list, and commas between items in the list count toward the limit.
         *  * If a tag contains a space, the API server handles the tag value as though it were wrapped in quotation marks, and the quotation marks count toward the character limit. So, for the purposes of character limits, the tag ''Foo-Baz'' contains seven characters, but the tag ''Foo Baz'' contains nine characters.
         */
        public Gee.ArrayList<string> tags { get; }

        /**
         * The YouTube video category associated with the video.
         *
         * You must set a value for this property if you call the {@link VideosResource.update} method and are updating
         * the {@link Video.snippet} part of a {@link Video} resource.
         */
        public string category_id { get; }

        /**
         * Indicates if the video is an upcoming/active live broadcast. Or it's "none" if the video is not an
         * upcoming/active live broadcast.
         *
         * Valid values for this property are:
         *
         *  * ``live``
         *  * ``none``
         *  * ``upcoming``
         */
        public string live_broadcast_content { get; }

        /**
         * The language of the text in the {@link Video} resource's {@link VideoSnippet.title} and
         * {@link VideoSnippet.description} properties.
         */
        public string default_language { get; }

        /**
         * The {@link VideoLocalization} object contains either a localized title and description for the video or
         * the title in the default language for the video's metadata.
         *
         *  * Localized text is returned in the resource snippet if the {@link VideosResource.list} request used the {@link VideosResource.ListRequest.hl} parameter to specify a language for which localized text should be returned //and// localized text is available in that language.
         *  * Metadata for the default language is returned if an {@link VideosResource.ListRequest.hl} parameter value is not specified //or// a value is specified but localized metadata is not available for the specified language.
         *
         * The property contains a read-only value. Use the {@link Video.localizations} object to add, update, or
         * delete localized titles.
         */
        public VideoLocalization localized { get; }

        /**
         * The {@link default_audio_language} property specifies the language spoken in the video's default audio track.
         */
        public string default_audio_language { get; }
    }
}