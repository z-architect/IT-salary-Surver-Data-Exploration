SELECT
  submission_date,
  COUNT(DISTINCT hacker_id) AS total_hackers,
  hackers.hacker_id,
  hackers.name
FROM
  hackers
  LEFT JOIN submissions ON hackers.hacker_id = submissions.hacker_id AND submissions.submission_date BETWEEN '2016-03-01' AND '2016-03-15'
GROUP BY
  submission_date,
  hackers.hacker_id,
  hackers.name
HAVING
  COUNT(submissions.submission_id) >= 1
  AND COUNT(submissions.submission_id) = (
    SELECT
      MAX(submission_count)
    FROM (
      SELECT
        submission_date,
        hacker_id,
        COUNT(submission_id) AS submission_count
      FROM
        submissions
      WHERE
        submission_date = date(s.submission_date)
      GROUP BY
        hacker_id
    ) s
    WHERE s.submission_date = submissions.submission_date
  )
ORDER BY
  submission_date


