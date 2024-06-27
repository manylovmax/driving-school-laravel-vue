export default function getDate(dateTimeString) {
    let res = null
    if (dateTimeString !== null && typeof dateTimeString === 'object'){
        dateTimeString = dateTimeString.date
    }
    if (dateTimeString)
        res = new Date(dateTimeString);
    return res;
}
